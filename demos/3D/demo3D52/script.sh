# demo3D52

echo "Downloading images from the CellOrganizer site"
DIRECTORY=./images/HeLa/3D/processed
if [ ! -d "$DIRECTORY" ]; then
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.8.0/docker/images/demo3D11.tgz
	mkdir -p ./images/HeLa/3D/processed
	tar -xvf demo3D11.tgz -C ./images/HeLa/3D/processed/
	rm -f demo3D11.tgz
fi

echo -e "
disp( 'demo3D52' );
options.verbose = true;
options.debug = true;
options.display = false;
options.model.name = 'demo3D52';
options = ml_initparam( options, struct( ...
    'train', struct( 'flag', 'framework' )));
options.nucleus.class = 'nuclear_membrane';
options.nucleus.type = 'spharm_rpdm';
options.cell.class = 'cell_membrane';
options.cell.type = 'spharm_rpdm';

% postprocess of parameterization: alignment
options.model.spharm_rpdm.postprocess = ~false;
% alignment method: 'major_axis' or 'foe'
options.model.spharm_rpdm.alignment_method = 'major_axis';
% plane of rotation: 'xy', 'xz', 'yz' or 'xyz'
options.model.spharm_rpdm.rotation_plane = 'xy';

% degree of the descriptor
options.model.spharm_rpdm.maxDeg = 31;
% cellular components: either {'cell'}, {'nuc'}, or {'cell', 'nuc'}
options.model.spharm_rpdm.components = {'cell', 'nuc'};

% latent dimension for the model
options.model.spharm_rpdm.latent_dim = 15;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FEEL FREE TO MODIFY THE VARIABLES IN THIS BLOCK
directory = 'images/HeLa/3D/processed';
proteinImagesDirectoryPath = [];
for i = 1:10; dnaImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch0_t1.tif']; cellImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch1_t1.tif']; proteinImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch2_t1.tif']; options.masks{i} = [directory filesep 'LAM_cell' num2str(i) '_mask_t1.tif']; end;
options = ml_initparam( options, struct( 'train', struct( 'flag', 'all' )));
options.model.resolution = [0.049, 0.049, 0.2000];
options.downsampling = [5, 5, 1];
options.model.filename = 'lamp2.xml';
options.model.id = 'lamp2';
options.model.name = 'lamp2';
%set nuclei and cell model name
options.nucleus.name = 'LAMP2';
options.cell.model = 'LAMP2';
%set the dimensionality of the model
dimensionality = '3D';
%documentation
options.documentation.description = 'This model has been trained using demo3D53 from CellOrganizer';

options.model.spharm_rpdm.segminnucfraction = 0.1;


" > input.txt




img2slml input.txt
