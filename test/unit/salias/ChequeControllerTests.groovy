package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(ChequeController)
@Mock(Cheque)
class ChequeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cheque/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.chequeInstanceList.size() == 0
        assert model.chequeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.chequeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.chequeInstance != null
        assert view == '/cheque/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cheque/show/1'
        assert controller.flash.message != null
        assert Cheque.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cheque/list'

        populateValidParams(params)
        def cheque = new Cheque(params)

        assert cheque.save() != null

        params.id = cheque.id

        def model = controller.show()

        assert model.chequeInstance == cheque
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cheque/list'

        populateValidParams(params)
        def cheque = new Cheque(params)

        assert cheque.save() != null

        params.id = cheque.id

        def model = controller.edit()

        assert model.chequeInstance == cheque
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cheque/list'

        response.reset()

        populateValidParams(params)
        def cheque = new Cheque(params)

        assert cheque.save() != null

        // test invalid parameters in update
        params.id = cheque.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cheque/edit"
        assert model.chequeInstance != null

        cheque.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cheque/show/$cheque.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cheque.clearErrors()

        populateValidParams(params)
        params.id = cheque.id
        params.version = -1
        controller.update()

        assert view == "/cheque/edit"
        assert model.chequeInstance != null
        assert model.chequeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cheque/list'

        response.reset()

        populateValidParams(params)
        def cheque = new Cheque(params)

        assert cheque.save() != null
        assert Cheque.count() == 1

        params.id = cheque.id

        controller.delete()

        assert Cheque.count() == 0
        assert Cheque.get(cheque.id) == null
        assert response.redirectedUrl == '/cheque/list'
    }
}
