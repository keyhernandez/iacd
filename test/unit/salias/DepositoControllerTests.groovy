package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(DepositoController)
@Mock(Deposito)
class DepositoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deposito/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.depositoInstanceList.size() == 0
        assert model.depositoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.depositoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.depositoInstance != null
        assert view == '/deposito/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deposito/show/1'
        assert controller.flash.message != null
        assert Deposito.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deposito/list'

        populateValidParams(params)
        def deposito = new Deposito(params)

        assert deposito.save() != null

        params.id = deposito.id

        def model = controller.show()

        assert model.depositoInstance == deposito
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deposito/list'

        populateValidParams(params)
        def deposito = new Deposito(params)

        assert deposito.save() != null

        params.id = deposito.id

        def model = controller.edit()

        assert model.depositoInstance == deposito
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deposito/list'

        response.reset()

        populateValidParams(params)
        def deposito = new Deposito(params)

        assert deposito.save() != null

        // test invalid parameters in update
        params.id = deposito.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deposito/edit"
        assert model.depositoInstance != null

        deposito.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deposito/show/$deposito.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deposito.clearErrors()

        populateValidParams(params)
        params.id = deposito.id
        params.version = -1
        controller.update()

        assert view == "/deposito/edit"
        assert model.depositoInstance != null
        assert model.depositoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deposito/list'

        response.reset()

        populateValidParams(params)
        def deposito = new Deposito(params)

        assert deposito.save() != null
        assert Deposito.count() == 1

        params.id = deposito.id

        controller.delete()

        assert Deposito.count() == 0
        assert Deposito.get(deposito.id) == null
        assert response.redirectedUrl == '/deposito/list'
    }
}
